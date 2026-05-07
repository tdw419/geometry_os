; mixed program
; initialization
  LDI r6, 0x8D4B32
  LDI r3, 2644
  LDI r1, 10
  LDI r11, 0x99A2FA
  LDI r4, 128
  LDI r14, 128
  CMP r1, r31
  JNZ r1, else_0
  SHR r22, r12, r1
  SUB r14, r2, r31
  MUL r8, r5, r6
  JMP endif_1
else_0:
  LDI r6, 1425
  LDI r1, 0x27ED1D
  LDI r5, 0xF6F45F
  WPIXEL
endif_1:
  CMPI r12, 83
  OR r11, r29, r10
  OR r13, r15, r6
  AND r9, r6, r14
  AND r13, r15, r8
  CMP r13, r9
  JZ r13, else_2
  ADD r15, r8, r13
  MUL r10, r8, r11
  MUL r5, r1, r12
  ADD r2, r13, r8
  JMP endif_3
else_2:
  LDI r1, 0xE27194
  FILL r1
  LDI r7, 0
  LDI r29, 10
  LDI r3, 0x23799B
  PSET r7, r29, r3
  LDI r9, 1105
  LDI r12, 2400
  LDI r10, 256
  PSET r9, r12, r10
endif_3:
  IKEY r10
  CMPI r10, 0x52B9F4
  JNZ r10, key_4
  SHL r9, r4, r6
  SHLI r8, r3, 0x337B49
  SAR r5, r10, r9
main_5:
  ANDI r8, r14, 16
  OR r7, r12, r8
  OR r9, r10, r11
  XOR r7, r0, r9
  IKEY r1
  CMPI r1, 0x1B4DA1
  JNZ r1, key_6
  CMPI r14, 128
  FRAME
  JMP main_5
