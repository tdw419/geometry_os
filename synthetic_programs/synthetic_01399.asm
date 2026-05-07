; counted animation
; initialization
  LDI r6, 0xD4A35C
  LDI r8, 3399
  LDI r13, 0xA07AE7
  LDI r4, 46
loop_0:
  ANDI r13, r8, 0x4E5ECC
  SUBI r0, r10, 77
  ADD r8, r13, r7
  LDI r27, 1
  SUB r4, r4, r27
  JNZ r4, loop_0
  LDI r6, 7
loop_1:
  SHR r0, r8, r13
  SHR r1, r8, r14
  CMPI r6, r11, 0x1F89CE
  LDI r5, 1
  SUB r6, r6, r5
  JNZ r6, loop_1
  HALT
