; mixed program
; initialization
  LDI r7, 3329
  LDI r15, 1721
  LDI r13, 255
  LDI r5, 2472
  LDI r8, 8
  LDI r4, 0x1AA65E
  PUSH r3
  PUSH r10
  PUSH r7
  OR r15, r1, r3
  MOD r4, r7, r13
  OR r11, r4, r3
  ADD r13, r7, r2
  POP r7
  POP r10
  POP r3
  LDI r5, 3558
  LDI r4, 64
  LDI r7, 0xB256CB
  WPIXEL
  IKEY r7
  CMPI r7, 0xB887BA
  JNZ r7, key_0
  SAR r12, r13, r1
  SHL r3, r10, r8
  SAR r2, r6, r12
  IKEY r12
  CMPI r12, 72
  JNZ r12, key_1
main_2:
  SHR r8, r2, r4
  SHR r8, r10, r9
  SAR r3, r5, r6
  MOD r6, r12, r10
  CMP r3, r5
  CMPI r3, 224
  CMPI r25, 0x01FADA
  XOR r8, r6, r2
  OR r6, r8, r1
  OR r10, r0, r4
  FRAME
  JMP main_2
