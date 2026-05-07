; mixed program
; initialization
  LDI r15, 0xB2A20B
  LDI r4, 1944
  LDI r8, 0
  LDI r2, 256
  LDI r9, 0x440DC4
  LDI r1, 0xC68919
  LDI r7, 1678
  LDI r1, 0x09EA0F
  LDI r8, 3017
  LDI r11, 3834
  LDI r1, 698
  LDI r8, 0x38874B
  LINE r1, r8, r11, r1, r8
  CMP r15, r10
  JZ r15, else_0
  SUB r12, r9, r5
  XOR r12, r8, r0
  MUL r15, r21, r8
  XOR r7, r13, r6
  JMP endif_1
else_0:
  LDI r3, 3257
  LDI r4, 0xC33832
  LDI r0, 128
  LDI r26, 16
  LDI r2, 0xD69369
  RECTF r3, r4, r0, r26, r2
endif_1:
  SHL r0, r31, r13
  SHLI r14, r13, 8
  SAR r14, r8, r4
  SAR r3, r6, r9
  LDI r8, 33
loop_2:
  SUBI r10, r14, 187
  LDI r12, 1
  SUB r8, r8, r12
  JNZ r8, loop_2
  IKEY r14
  CMPI r14, 0xF48385
  JNZ r14, key_3
main_4:
  CMPI r8, 64
  SHLI r9, r14, 0
  SHR r12, r2, r15
  SHR r5, r7, r0
  SHL r2, r13, r9
  LDI r0, 1769
  LDI r5, 1276
  LDI r15, 10
  TEXT r0, r5, r15, "HELLO"
  SHL r13, r1, r5
  CMPI r12, 16
  FRAME
  JMP main_4
