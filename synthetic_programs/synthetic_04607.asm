; mixed program
; initialization
  LDI r0, 3041
  LDI r13, 0x738841
  LDI r12, 2
  LDI r6, 0x6868CE
  LDI r15, 0x38D2F5
  LDI r9, 2825
  LDI r14, 0xEAC871
  LDI r7, 603
  LDI r9, 0x326103
  LDI r2, 3146
  DRAWTEXT r7, r9, r2, "WORLD"
  CMPI r5, 54
  LDI r1, 0xF73C5F
  LDI r5, 2
  LDI r16, 0xC8ACEA
  LDI r1, 0x0C6BB9
  LDI r10, 0x4C4056
  LINE r1, r5, r16, r1, r10
  PUSH r14
  PUSH r13
  SHL r14, r11, r15
  SUB r15, r0, r4
  OR r4, r2, r5
  POP r13
  POP r14
  XOR r1, r12, r15
  OR r1, r8, r0
  CMPI r6, 53
  LDI r1, 24
loop_0:
  LDI r6, 2616
  LDI r12, 0x73963E
  LDI r0, 0
  PSET r6, r12, r0
  SHL r7, r5, r14
  CMPI r6, r11, 16
  ANDI r11, r15, 1
  LDI r3, 1
  SUB r1, r1, r3
  JNZ r1, loop_0
  CALL func_1
func_1:
  SHR r3, r12, r10
  SUB r4, r12, r1
  SHL r9, r0, r8
  ADD r31, r8, r14
  AND r4, r12, r15
  MOD r7, r0, r4
  RET
main_2:
  LDI r1, 4
  LDI r0, 660
  LDI r2, 0xE5FD34
  PSET r1, r0, r2
  IKEY r10
  CMPI r10, 4
  JNZ r10, key_3
  IKEY r13
  CMPI r13, 4
  JNZ r13, key_4
  SUBI r12, r10, 255
  SHL r1, r14, r0
  SHR r1, r6, r0
  SHLI r0, r6, 64
  SAR r14, r2, r4
  CMP r13, r14
  FRAME
  JMP main_2
