; mixed program
; initialization
  LDI r9, 1
  LDI r13, 0x76822D
  LDI r7, 0x087C82
  LDI r14, 680
  LDI r2, 0x728E48
  LDI r5, 0
  LDI r12, 256
  STORE r12, r12
  LOAD r15, r12
  LDI r6, 383
  STORE r6, r4
  LOAD r1, r6
  LDI r28, 0x4892D0
  STORE r28, r6
  LOAD r10, r28
  LDI r8, 848
  STORE r8, r14
  LOAD r1, r8
  IKEY r6
  CMPI r6, 0x694D5A
  JNZ r6, key_0
  AND r12, r0, r1
main_1:
  CMP r14, r2
  SHLI r4, r14, 2
  SHL r9, r13, r12
  SHR r4, r7, r2
  SHR r4, r14, r13
  LDI r16, 2188
  LDI r8, 3529
  LDI r13, 8
  LDI r9, 32
  LDI r11, 3789
  RECTF r16, r8, r13, r9, r11
  SUBI r12, r13, 128
  FRAME
  JMP main_1
