; mixed program
; initialization
  LDI r10, 2489
  LDI r3, 10
  CALL func_0
func_0:
  ADD r8, r20, r4
  AND r4, r7, r6
  RET
  CMPI r13, 64
  CMP r0, r9
  JNZ r0, else_1
  MOD r4, r15, r8
  JMP endif_2
else_1:
  LDI r11, 1
  LDI r5, 607
  LDI r15, 128
  LDI r6, 0x0F6914
  LDI r0, 1003
  LINE r11, r5, r15, r6, r0
endif_2:
  CMP r10, r9
  JNZ r10, else_3
  SHR r12, r13, r3
  ADD r4, r15, r14
  JMP endif_4
else_3:
  LDI r1, 0xE5930E
  LDI r0, 0xE09DA8
  LDI r5, 2932
  LDI r7, 255
  LDI r6, 8
  LINE r1, r0, r5, r7, r6
  LDI r6, 3949
  LDI r7, 0xBD6A37
  LDI r2, 0x045EE5
  LDI r14, 64
  LDI r8, 3732
  LINE r6, r7, r2, r14, r8
  LDI r11, 32
  LDI r0, 2537
  LDI r3, 10
  LDI r8, 0x43F265
  LDI r7, 0xBDC794
  LINE r11, r0, r3, r8, r7
endif_4:
  IKEY r14
  CMPI r14, 28
  JNZ r14, key_5
main_6:
  SHR r8, r5, r15
  SHL r9, r6, r2
  SAR r1, r6, r2
  SUB r4, r5, r8
  FRAME
  JMP main_6
