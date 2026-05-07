; mixed program
; initialization
  LDI r14, 64
  LDI r3, 3644
  LDI r13, 0xF84A4A
  LDI r18, 657
  LDI r9, 0xA1ED20
  LDI r1, 216
; palette
  LDI r13, 0x3022
  LDI r4, 1
  LDI r0, 0x888800
  STORE r13, r0
  ADD r13, r13, r4
  LDI r0, 0x880088
  STORE r13, r0
  ADD r13, r13, r4
  LDI r0, 0xFF0000
  STORE r13, r0
  ADD r13, r13, r4
  LDI r0, 0x00FF44
  STORE r13, r0
  ADD r13, r13, r4
  LDI r0, 0x000066
  STORE r13, r0
  ADD r13, r13, r4
  LDI r0, 0xFF8800
  STORE r13, r0
  ADD r13, r13, r4
  PUSH r14
  PUSH r8
  PUSH r12
  SUB r5, r1, r14
  SUB r6, r5, r12
  DIV r8, r9, r0
  MOD r3, r2, r27
  POP r12
  POP r8
  POP r14
  LDI r12, 28
loop_0:
  SUBI r0, r3, 62
  ADD r6, r1, r10
  LDI r11, 1
  SUB r12, r12, r11
  JNZ r12, loop_0
  SAR r14, r18, r10
  SHLI r0, r2, 1
  LDI r22, 9
loop_1:
  LDI r0, 0x742AE1
  LDI r15, 1097
  LDI r10, 867
  PSETI
  LDI r10, 255
  LDI r8, 444
  LDI r11, 0xA5D535
  PSETI
  SUBI r0, r15, 203
  CMPI r14, r0, 8
  LDI r9, 1
  SUB r22, r22, r9
  JNZ r22, loop_1
  LDI r11, 0xC3CA3D
  LDI r10, 0x8FA698
  LDI r8, 0
  PSETI
  IKEY r12
  CMPI r12, 8
  JNZ r12, key_2
  IKEY r6
  CMPI r6, 137
  JNZ r6, key_3
  LDI r6, 3456
  STORE r6, r30
  LOAD r12, r6
  LDI r13, 0x8CF720
  STORE r13, r4
  LOAD r6, r13
  HALT
