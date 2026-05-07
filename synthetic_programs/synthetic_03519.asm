; mixed program
; initialization
  LDI r1, 602
  LDI r11, 32
  LDI r15, 16
  LDI r12, 0
  LDI r6, 0x8D28BE
  LDI r8, 16
  AND r11, r2, r10
  CMP r4, r0
  JZ r4, else_0
  ADD r12, r14, r1
  SHR r10, r5, r7
  SUB r7, r9, r4
  ADD r3, r0, r8
  JMP endif_1
else_0:
  LDI r15, 2808
  LDI r5, 1819
  LDI r13, 2963
  LDI r10, 128
  LDI r14, 0xC3906A
  RECTF r15, r5, r13, r10, r14
  LDI r5, 3469
  FILL r5
  LDI r22, 10
  FILL r22
  LDI r6, 3570
  LDI r15, 8
  LDI r0, 10
  PSETI
endif_1:
  IKEY r12
  CMPI r12, 0xA7DEE4
  JNZ r12, key_2
  CALL func_3
func_3:
  ADD r2, r9, r15
  XOR r15, r5, r0
  MOD r5, r15, r11
  MOD r18, r3, r14
  RET
main_4:
  ANDI r8, r11, 4
  OR r11, r4, r10
  OR r6, r13, r11
  FRAME
  JMP main_4
