; mixed program
; initialization
  LDI r9, 654
  LDI r3, 10
  LDI r11, 32
; palette
  LDI r10, 0x8019
  LDI r1, 1
  LDI r12, 0x8800FF
  STORE r10, r12
  ADD r10, r10, r1
  LDI r12, 0xFF8800
  STORE r10, r12
  ADD r10, r10, r1
  LDI r12, 0x880088
  STORE r10, r12
  ADD r10, r10, r1
  LDI r12, 0xFF00FF
  STORE r10, r12
  ADD r10, r10, r1
  LDI r12, 0x8800FF
  STORE r10, r12
  ADD r10, r10, r1
  LDI r12, 0x00AAFF
  STORE r10, r12
  ADD r10, r10, r1
  LDI r12, 0xFFFFFF
  STORE r10, r12
  ADD r10, r10, r1
  LDI r12, 0xFFAA00
  STORE r10, r12
  ADD r10, r10, r1
  MUL r15, r14, r4
  CMP r0, r3
  LDI r2, 0
loop_0:
  ADDI r0, r14, 0x4EFC08
  MUL r8, r6, r10
  AND r14, r12, r4
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_0
  CMP r6, r5
  JNZ r6, else_1
  MUL r10, r2, r1
  DIV r16, r8, r13
  MUL r4, r1, r30
  JMP endif_2
else_1:
  LDI r0, 2
  LDI r7, 10
  LDI r0, 0x8D0C1C
  WPIXEL
  LDI r9, 621
  LDI r4, 2483
  LDI r11, 0x7E1DCB
  LDI r2, 2
  CIRCLE r9, r4, r11, r2
endif_2:
  SHR r13, r10, r14
  SHR r5, r4, r0
  SAR r1, r7, r11
  HALT
