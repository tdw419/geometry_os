; counted animation
; initialization
  LDI r0, 1029
  LDI r7, 0xC5C0C8
  LDI r15, 0x8FF5DA
loop_0:
  CMPI r4, r10, 22
  ANDI r5, r13, 128
  LDI r6, 1
  SUB r15, r15, r6
  JNZ r15, loop_0
  LDI r13, 0x181932
loop_1:
  ANDI r6, r3, 0x9172D2
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_1
  HALT
