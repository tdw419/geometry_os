; mixed program
; initialization
  LDI r6, 32
  LDI r9, 3617
  LDI r12, 128
  LDI r3, 1
  LDI r1, 799
  CMPI r8, 16
  CMPI r13, 255
  LDI r4, 256
loop_0:
  ANDI r13, r7, 0x61F534
  MUL r4, r15, r3
  LDI r15, 1
  SUB r4, r4, r15
  JNZ r4, loop_0
main_1:
  LDI r6, 250
  FILL r6
  ANDI r8, r11, 0x3F2F55
  AND r3, r2, r14
  OR r5, r11, r12
  AND r2, r5, r12
  XOR r0, r10, r7
  LDI r3, 32
  LDI r2, 2
  LDI r14, 2017
  LDI r3, 2040
  CIRCLE r3, r2, r14, r3
  CMPI r0, 0xA44816
  FRAME
  JMP main_1
