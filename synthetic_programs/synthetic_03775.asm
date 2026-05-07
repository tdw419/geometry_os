; input driven program
; initialization
  LDI r3, 0
  LDI r28, 3451
main_0:
  SUB r15, r5, r2
  IKEY r9
  CMPI r9, 12
  JNZ r9, key_1
  LDI r6, 1988
  LDI r3, 0x5D7AD8
  LDI r7, 2465
  PSETI
  ADDI r16, r0, 256
  OR r13, r11, r6
  FRAME
  JMP main_0
