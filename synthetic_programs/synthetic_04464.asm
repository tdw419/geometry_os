; mixed program
; initialization
  LDI r9, 256
  LDI r10, 0xC30804
  CALL func_0
func_0:
  ADD r30, r4, r6
  SHL r13, r5, r7
  RET
  LDI r3, 0xE9AD86
loop_1:
  LDI r0, 0xCE236C
  LDI r1, 0
  LDI r10, 294
  LDI r1, 3756
  LDI r7, 1137
  RECTF r0, r1, r10, r1, r7
  ADDI r10, r0, 2
  SUBI r3, r4, 128
  LDI r9, 64
  LDI r10, 1385
  LDI r14, 0xEF92DC
  PSET r9, r10, r14
  LDI r8, 1
  SUB r3, r3, r8
  JNZ r3, loop_1
  IKEY r4
  CMPI r4, 256
  JNZ r4, key_2
  CMPI r9, 0x246404
  LDI r7, 0x7A9EC9
  LDI r14, 0x2C71FC
  LDI r13, 4
  LDI r4, 64
  LDI r2, 710
  LINE r7, r14, r13, r4, r2
  LDI r7, 47
loop_3:
  LDI r12, 3914
  FILL r12
  SHR r13, r1, r21
  ADDI r0, r15, 64
  AND r4, r14, r0
  LDI r9, 1
  SUB r7, r7, r9
  JNZ r7, loop_3
  CALL func_4
func_4:
  XOR r3, r8, r13
  OR r10, r11, r13
  DIV r13, r2, r9
  MOD r8, r6, r10
  ADD r14, r5, r3
  DIV r2, r5, r3
  RET
main_5:
  SUBI r12, r6, 205
  LDI r6, 2635
  LDI r1, 8
  LDI r1, 0xFE5389
  LDI r0, 0xF601F7
  LDI r4, 0x6AE08E
  LINE r6, r1, r1, r0, r4
  FRAME
  JMP main_5
