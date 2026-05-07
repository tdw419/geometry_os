; mixed program
; initialization
  LDI r12, 256
  LDI r5, 0xD23026
  LDI r4, 4
  LDI r0, 8
  LDI r2, 32
  LDI r7, 874
  LDI r8, 705
  LDI r3, 1769
; palette
  LDI r14, 0x30D0
  LDI r9, 1
  LDI r6, 0xFFFF00
  STORE r14, r6
  ADD r14, r14, r9
  LDI r6, 0x0044FF
  STORE r14, r6
  ADD r14, r14, r9
  LDI r6, 0x0044FF
  STORE r14, r6
  ADD r14, r14, r9
  LDI r6, 0xFFFFFF
  STORE r14, r6
  ADD r14, r14, r9
  LDI r6, 0xFF00FF
  STORE r14, r6
  ADD r14, r14, r9
  LDI r6, 0x880088
  STORE r14, r6
  ADD r14, r14, r9
  LDI r6, 0xFF0000
  STORE r14, r6
  ADD r14, r14, r9
  CMP r15, r4
  JZ r15, else_0
  OR r11, r5, r7
  AND r15, r4, r14
  SUB r3, r8, r10
  XOR r5, r12, r9
  JMP endif_1
else_0:
  LDI r17, 32
  LDI r8, 128
  LDI r3, 922
  PSETI
  LDI r14, 128
  FILL r14
  LDI r9, 4
  LDI r12, 128
  LDI r2, 32
  PSETI
endif_1:
  PUSH r8
  DIV r5, r10, r15
  ADD r3, r15, r9
  ADD r4, r15, r3
  SHR r14, r2, r11
  ADD r15, r4, r11
  POP r8
  SHLI r5, r9, 0x4C2EE8
  SHLI r4, r9, 8
  SHLI r1, r14, 0x94F369
  SHL r0, r6, r20
  OR r15, r6, r4
  XOR r1, r8, r12
  OR r0, r15, r11
  OR r5, r6, r0
  SAR r9, r13, r7
  SHR r10, r11, r12
  SHL r14, r11, r3
  SHR r0, r8, r5
  LDI r9, 4
  STORE r9, r9
  LOAD r13, r9
  LDI r13, 255
  STORE r13, r12
  LOAD r1, r13
  LDI r11, 1
  STORE r11, r5
  LOAD r4, r11
  LDI r9, 2765
  STORE r9, r3
  LOAD r4, r9
  CMP r3, r7
main_2:
  IKEY r1
  CMPI r1, 0x35B3B5
  JNZ r1, key_3
  OR r15, r11, r6
  OR r0, r14, r8
  AND r17, r5, r11
  OR r5, r8, r25
  FRAME
  JMP main_2
