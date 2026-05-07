; mixed program
; initialization
  LDI r13, 153
  LDI r0, 2
  LDI r4, 0x29649A
  LDI r3, 2720
  LDI r1, 0x003C07
  LDI r11, 8
  LDI r9, 0x1A4B68
  LDI r14, 16
  CALL func_0
func_0:
  MOD r5, r9, r1
  SUB r6, r10, r9
  AND r1, r13, r4
  OR r5, r12, r8
  SHR r5, r9, r10
  RET
  AND r8, r0, r12
  LDI r13, 0x2051x414571
  STORE r13, r6
  LOAD r12, r13
  LDI r13, 1920
  STORE r13, r6
  LOAD r5, r13
  LDI r3, 0xE6D3FA
loop_1:
  ANDI r13, r6, 256
  LDI r2, 1
  SUB r3, r3, r2
  JNZ r3, loop_1
  SAR r9, r12, r10
  SHL r12, r4, r9
  SAR r11, r13, r3
  SHL r10, r5, r12
  SAR r11, r10, r9
  SHR r15, r0, r12
  SHL r8, r7, r10
  LDI r5, 3638
  LDI r2, 2415
  LDI r14, 2
  LDI r4, 256
  CIRCLE r5, r2, r14, r4
main_2:
  IKEY r5
  CMPI r5, 0x4866D2
  JNZ r5, key_3
  ADDI r4, r2, 0x707B44
  CMP r28, r5
  SHLI r9, r11, 0
  SHLI r10, r14, 3
  SUB r25, r5, r13
  XOR r3, r27, r5
  OR r14, r23, r6
  AND r6, r3, r11
  FRAME
  JMP main_2
