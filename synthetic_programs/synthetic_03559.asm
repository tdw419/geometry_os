; mixed program
; initialization
  LDI r9, 841
  LDI r4, 2278
  LDI r5, 1017
  LDI r10, 0x9E5068
  LDI r1, 0x199FA9
; palette
  LDI r14, 0x22AA
  LDI r15, 1
  LDI r9, 0x0044FF
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x00FFFF
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0xFFEE00
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0xFF00FF
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0xFF8800
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x00FF00
  STORE r14, r9
  ADD r14, r14, r15
  LDI r9, 0x880088
  STORE r14, r9
  ADD r14, r14, r15
  LDI r5, 2
  STORE r5, r10
  LOAD r12, r5
  LDI r4, 0x49BBBE
  STORE r4, r1
  LOAD r2, r4
  CMP r12, r8
  JZ r12, else_0
  OR r0, r15, r2
  SHR r14, r6, r4
  MUL r19, r0, r1
  JMP endif_1
else_0:
  LDI r11, 0x3343AA
  LDI r0, 64
  LDI r2, 1946
  WPIXEL
endif_1:
  PUSH r12
  PUSH r6
  PUSH r0
  PUSH r20
  MOD r2, r15, r14
  AND r8, r11, r10
  SUB r15, r13, r14
  POP r20
  POP r0
  POP r6
  POP r12
  CALL func_2
func_2:
  MUL r14, r15, r0
  SUB r21, r9, r12
  RET
  HALT
