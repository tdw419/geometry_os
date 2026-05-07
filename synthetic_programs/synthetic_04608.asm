; mixed program
; initialization
  LDI r5, 2
  LDI r8, 0x38A34C
  LDI r7, 16
  CMPI r2, 44
  CALL func_0
func_0:
  ADD r15, r0, r1
  ADD r15, r7, r0
  ADD r12, r9, r8
  SUB r13, r12, r6
  RET
  CMPI r6, 59
  SHR r14, r19, r8
  SAR r11, r1, r2
  SHLI r0, r1, 2
  SAR r14, r6, r15
  SHL r8, r5, r3
  SHLI r8, r1, 0
  SHR r2, r7, r15
main_1:
  SUBI r3, r11, 207
  ADDI r12, r7, 178
  LDI r4, 0x7D2AC7
  LDI r3, 256
  LDI r14, 501
  LDI r11, 3491
  LDI r6, 0xFAD820
  LINE r4, r3, r14, r11, r6
  ANDI r9, r1, 255
  XOR r1, r0, r14
  XOR r5, r15, r2
  OR r9, r29, r7
  XOR r14, r12, r11
  AND r5, r14, r1
  XOR r0, r3, r1
  FRAME
  JMP main_1
