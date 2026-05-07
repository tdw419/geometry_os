; mixed program
; initialization
  LDI r14, 0x774F1C
  LDI r0, 0x3EE06D
  LDI r6, 0xD75BA0
  LDI r1, 2
  LDI r13, 2451
  LDI r8, 1052
  LDI r2, 1831
  LDI r12, 10
  PUSH r5
  PUSH r2
  PUSH r0
  SHR r8, r6, r2
  OR r12, r13, r10
  AND r0, r12, r13
  POP r0
  POP r2
  POP r5
  PUSH r10
  PUSH r11
  PUSH r13
  PUSH r14
  MUL r11, r18, r31
  ADD r9, r7, r26
  OR r4, r0, r14
  AND r15, r9, r2
  AND r8, r5, r10
  POP r14
  POP r13
  POP r11
  POP r10
  LDI r5, 0x5D0908
  LDI r4, 0x384535
  LDI r0, 1
  LDI r8, 0xAB6E38
  LDI r9, 1493
  RECTF r5, r4, r0, r8, r9
  XOR r1, r9, r31
  XOR r13, r11, r26
  AND r14, r0, r2
  CMP r26, r1
  JNZ r26, else_0
  AND r2, r10, r14
  JMP endif_1
else_0:
  LDI r9, 0xE828A5
  FILL r9
  LDI r12, 0xCC7796
  LDI r0, 0xB8692C
  LDI r2, 0x37C209
  WPIXEL
  LDI r15, 255
  FILL r15
endif_1:
  IKEY r6
  CMPI r6, 0x05135E
  JNZ r6, key_2
  XOR r8, r15, r1
  AND r14, r10, r7
  OR r12, r10, r6
  XOR r3, r7, r0
  LDI r3, 1833
  LDI r7, 1
  LDI r0, 0x48F385
  TEXT r3, r7, r0, "HELLO"
  HALT
