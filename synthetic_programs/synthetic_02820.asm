; mixed program
; initialization
  LDI r9, 1594
  LDI r5, 0
  LDI r1, 64
  LDI r4, 4
  IKEY r1
  CMPI r1, 256
  JNZ r1, key_0
  LDI r1, 851
  LDI r1, 255
  LDI r8, 1169
  LDI r10, 2062
  LDI r4, 32
  LINE r1, r1, r8, r10, r4
  CALL func_1
func_1:
  MOD r13, r12, r15
  SHL r14, r8, r1
  SUB r7, r5, r20
  RET
  LDI r2, 2853
  STORE r2, r14
  LOAD r15, r2
  LDI r6, 64
  STORE r6, r9
  LOAD r10, r6
  LDI r15, 15
loop_2:
  ANDI r14, r5, 230
  ANDI r14, r8, 0x0B7F75
  LDI r0, 759
  LDI r8, 1921
  LDI r12, 86
  PSET r0, r8, r12
  LDI r11, 1
  SUB r15, r15, r11
  JNZ r15, loop_2
  LDI r12, 23
loop_3:
  ADDI r9, r12, 235
  LDI r8, 10
  LDI r8, 32
  LDI r14, 0xDB04B0
  WPIXEL
  LDI r13, 1
  SUB r12, r12, r13
  JNZ r12, loop_3
main_4:
  LDI r2, 256
  LDI r6, 1384
  LDI r13, 255
  TEXT r2, r6, r13, "HELLO"
  AND r7, r5, r13
  AND r6, r7, r4
  XOR r6, r21, r12
  AND r0, r3, r7
  SHL r2, r14, r12
  SHR r10, r11, r12
  SHLI r10, r14, 0xD1BCB6
  SHR r7, r8, r2
  OR r0, r15, r12
  AND r8, r0, r12
  OR r11, r0, r13
  OR r14, r7, r10
  AND r25, r1, r15
  OR r14, r2, r1
  AND r14, r5, r0
  AND r4, r9, r15
  CMP r5, r7
  FRAME
  JMP main_4
