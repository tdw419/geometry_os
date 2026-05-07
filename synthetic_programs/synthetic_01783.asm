; mixed program
; initialization
  LDI r4, 906
  LDI r9, 32
  LDI r3, 1410
  LDI r10, 0xF41808
  LDI r13, 3590
  LDI r2, 2328
  LDI r5, 0x59CA36
  LDI r13, 32
loop_0:
  SUBI r5, r1, 4
  LDI r15, 210
  LDI r5, 0x8A08F5
  LDI r4, 0x3996A5
  PSET r15, r5, r4
  SUBI r5, r0, 0x368464
  SHR r7, r12, r1
  LDI r9, 1
  SUB r13, r13, r9
  JNZ r13, loop_0
  LDI r6, 0x7B1868
  STORE r6, r2
  LOAD r14, r6
  LDI r13, 32
  STORE r13, r15
  LOAD r3, r13
  LDI r2, 0x50456E
  STORE r2, r13
  LOAD r15, r2
  LDI r12, 256
  STORE r12, r14
  LOAD r30, r12
  LDI r2, 0xC41281
  STORE r2, r11
  LOAD r7, r2
  LDI r0, 2596
  STORE r0, r22
  LOAD r2, r0
  LDI r14, 255
  STORE r14, r5
  LOAD r7, r14
main_1:
  IKEY r8
  CMPI r8, 2
  JNZ r8, key_2
  SHL r8, r7, r21
  SHLI r15, r6, 2
  SAR r8, r3, r13
  SHL r19, r14, r12
  SHR r4, r6, r9
  CMPI r8, 2
  SUB r30, r12, r4
  SHR r12, r4, r1
  SHL r7, r6, r14
  SHLI r1, r9, 255
  SHR r7, r10, r8
  FRAME
  JMP main_1
