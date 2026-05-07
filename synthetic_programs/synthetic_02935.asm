; mixed program
; initialization
  LDI r26, 1
  LDI r13, 8
  LDI r1, 2570
  LDI r2, 2431
  LDI r6, 2
  LDI r8, 0x98F61E
  LDI r9, 32
  LDI r7, 0x3C4610
  CMP r14, r7
  JNZ r14, else_0
  SHL r11, r4, r10
  SHL r3, r8, r2
  SHR r2, r8, r4
  SHL r11, r0, r14
  JMP endif_1
else_0:
  LDI r14, 16
  LDI r1, 256
  LDI r14, 1983
  LDI r2, 64
  CIRCLE r14, r1, r14, r2
  LDI r12, 1473
  FILL r12
endif_1:
  OR r4, r2, r15
  OR r5, r6, r9
  SHLI r0, r7, 4
  SAR r0, r9, r22
  SHLI r6, r8, 0x594D50
  SAR r2, r12, r10
  CMPI r5, 1
  LDI r11, 2
loop_2:
  ANDI r9, r13, 255
  LDI r13, 4
  LDI r1, 3416
  LDI r2, 908
  LDI r10, 3448
  LDI r4, 2051
  LINE r13, r1, r2, r10, r4
  LDI r7, 1
  SUB r11, r11, r7
  JNZ r11, loop_2
  XOR r8, r10, r3
main_3:
  LDI r10, 0x039972
  LDI r1, 0
  LDI r5, 3825
  WPIXEL
  IKEY r8
  CMPI r8, 4
  JNZ r8, key_4
  FRAME
  JMP main_3
