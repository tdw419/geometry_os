; mixed program
; initialization
  LDI r6, 0xD47083
  LDI r9, 255
; palette
  LDI r14, 0x506E
  LDI r0, 1
  LDI r4, 0xDD0044
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0x000000
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0xFF00FF
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0x00AAFF
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0x444444
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0x8800FF
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0x880088
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0x8800FF
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0x444444
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0xAAAAAA
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0xFFAA00
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0x880088
  STORE r14, r4
  ADD r14, r14, r0
  LDI r4, 0xAAAAAA
  STORE r14, r4
  ADD r14, r14, r0
  MOD r1, r21, r9
  LDI r13, 0xF4072A
loop_0:
  MUL r14, r11, r10
  LDI r8, 1
  SUB r13, r13, r8
  JNZ r13, loop_0
  CMP r9, r5
  JNZ r9, else_1
  OR r14, r9, r7
  ADD r13, r7, r3
  JMP endif_2
else_1:
  LDI r4, 0x9139BD
  LDI r9, 2953
  LDI r10, 255
  LDI r13, 2942
  CIRCLE r4, r9, r10, r13
endif_2:
  HALT
