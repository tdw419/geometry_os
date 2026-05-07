; mixed program
; initialization
  LDI r15, 912
  LDI r0, 4
  LDI r14, 0x5B6E26
  LDI r29, 0xE5EDFC
  LDI r3, 1450
  LDI r7, 2569
; palette
  LDI r5, 0x20F5
  LDI r6, 1
  LDI r12, 0xFFAA00
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0x550077
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0x00FFFF
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0x0044FF
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0xAAAAAA
  STORE r5, r12
  ADD r5, r5, r6
  LDI r7, 14
loop_0:
  SHR r10, r9, r5
  SUB r4, r8, r7
  LDI r5, 16
  LDI r10, 774
  LDI r0, 122
  PSET r5, r10, r0
  LDI r15, 1
  SUB r7, r7, r15
  JNZ r7, loop_0
  LDI r10, 0xCBCAF5
  FILL r10
  SAR r9, r12, r7
  SHR r5, r14, r9
  SHLI r2, r8, 1
  CMP r4, r8
  JNZ r4, else_1
  OR r2, r15, r28
  SUB r14, r2, r27
  SHL r6, r0, r22
  JMP endif_2
else_1:
  LDI r9, 0
  LDI r14, 920
  LDI r13, 218
  LDI r14, 0x030A11
  CIRCLE r9, r14, r13, r14
  LDI r11, 10
  LDI r0, 1717
  LDI r5, 2404
  LDI r26, 10
  LDI r9, 16
  RECTF r11, r0, r5, r26, r9
  LDI r5, 8
  LDI r1, 1565
  LDI r11, 255
  LDI r4, 2
  LDI r4, 16
  LINE r5, r1, r11, r4, r4
  LDI r1, 0x3544F8
  LDI r11, 0x9F78DD
  LDI r1, 0x532FA0
  LDI r14, 823
  CIRCLE r1, r11, r1, r14
endif_2:
  XOR r15, r7, r1
  AND r12, r14, r11
  CALL func_3
func_3:
  AND r15, r2, r9
  DIV r11, r10, r3
  SUB r19, r1, r9
  XOR r12, r9, r0
  RET
main_4:
  ANDI r29, r1, 0x3D5063
  OR r3, r11, r14
  XOR r4, r15, r14
  OR r3, r12, r13
  LDI r14, 0x129186
  LDI r1, 0xD27611
  LDI r3, 0x81FDFE
  TEXT r14, r1, r3, "HELLO"
  SAR r0, r12, r14
  SAR r2, r9, r11
  SHL r6, r14, r11
  SHLI r14, r10, 2
  FRAME
  JMP main_4
