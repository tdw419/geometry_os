; mixed program
; initialization
  LDI r1, 0x4BCCE6
  LDI r12, 4
  LDI r4, 0x8A7792
  LDI r2, 0xF431BA
  LDI r3, 0x64DC1C
  LDI r10, 3963
  LDI r11, 10
  LDI r24, 0xE7D53B
  SHL r8, r14, r3
  SHLI r1, r7, 0xABA964
  SHR r1, r15, r7
  LDI r5, 0x5DA0EB
  STORE r5, r6
  LOAD r15, r5
  LDI r13, 2
  STORE r13, r6
  LOAD r8, r13
  LDI r1, 1862
  STORE r1, r7
  LOAD r13, r1
  IKEY r13
  CMPI r13, 0x6CB1F5
  JNZ r13, key_0
  LDI r11, 256
  LDI r15, 3338
  LDI r0, 0
  LDI r0, 1
  CIRCLE r11, r15, r0, r0
  LDI r0, 47
  LDI r10, 3415
  LDI r6, 967
  LDI r14, 0xFB3092
  LDI r8, 1712
  LINE r0, r10, r6, r14, r8
  CMPI r8, 0x769972
  IKEY r14
  CMPI r14, 0xF0FD2B
  JNZ r14, key_1
  LDI r13, 27
loop_2:
  CMPI r9, r7, 64
  SUBI r4, r1, 160
  SUBI r7, r13, 0x8F1ADE
  LDI r10, 1
  SUB r13, r13, r10
  JNZ r13, loop_2
main_3:
  ANDI r8, r14, 199
  SHL r0, r5, r15
  SHL r0, r13, r5
  SHLI r11, r4, 0
  FRAME
  JMP main_3
