; mixed program
; initialization
  LDI r11, 2
  LDI r7, 3949
  LDI r8, 2
  LDI r4, 3210
  LDI r9, 2186
  LDI r0, 1
  LDI r3, 3554
  AND r14, r8, r0
  AND r6, r1, r0
  OR r5, r11, r2
  OR r3, r8, r19
  LDI r10x5036, 256
  STORE r14, r10
  LOAD r4, r14
  LDI r15, 1
  STORE r15, r6
  LOAD r4, r15
  LDI r9, 29
loop_0:
  ANDI r4, r9, 0x0E7823
  SHL r12, r4, r5
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_0
  SHR r13, r1, r9
  SAR r13, r31, r28
  SHR r15, r6, r10
  SHR r1, r12, r11
  CMP r0, r3
  LDI r10, 256
  STORE r10, r10
  LOAD r8, r10
  LDI r2, 255
  STORE r2, r11
  LOAD r13, r2
  LDI r9, 0xD93D64
  STORE r9, r19
  LOAD r0, r9
  LDI r0, 1307
  LDI r12, 0xA8EAEA
  LDI r11, 255
  DRAWTEXT r0, r12, r11, "WORLD"
  HALT
