; mixed program
; initialization
  LDI r14, 2
  LDI r0, 3609
  LDI r8, 0x775072
  IKEY r8
  CMPI r8, 0x99C838
  JNZ r8, key_0
  SHL r7, r11, r0
  SHL r7, r8, r1
  SAR r11, r6, r5
  SHL r5, r0, r13
  LDI r1, 287
  FILL r1
  CMP r4, r5
  JNZ r4, else_1
  XOR r8, r14, r7
  SHR r2, r4, r7
  SHL r2, r10, r14
  AND r9, r25, r5
  JMP endif_2
else_1:
  LDI r3, 0
  LDI r6, 2714
  LDI r27, 32
  LDI r8, 255
  CIRCLE r3, r6, r27, r8
endif_2:
main_3:
  SAR r8, r14, r11
  SHL r0, r2, r13
  LDI r5, 10
  LDI r7, 0x876651
  LDI r3, 0x1367D1
  WPIXEL
  FRAME
  JMP main_3
