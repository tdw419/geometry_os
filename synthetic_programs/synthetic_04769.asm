; mixed program
; initialization
  LDI r14, 4
  LDI r1, 16
  LDI r5, 0x961165
  LDI r3, 0xF5E4FE
  LDI r11, 1213
  LDI r8, 0x08877B
  SHLI r6, r5, 6
  SAR r10, r3, r11
  LDI r9, 256
  LDI r1, 0x4C270F
  LDI r6, 4
  TEXT r9, r1, r6, "HELLO"
  LDI r15, 1
  LDI r15, 398
  LDI r15, 3691
  DRAWTEXT r15, r15, r15, "WORLD"
  CALL func_0
func_0:
  SHR r10, r11, r0
  AND r8, r10, r4
  ADD r12, r16, r4
  SHR r2, r8, r10
  OR r12, r7, r9
  OR r9, r2, r12
  RET
  LDI r0, 4
  STORE r0, r6
  LOAD r7, r0
  LDI r11, 64
  STORE r11, r15
  LOAD r14, r11
  LDI r0, 0x92F6F5
  STORE r0, r12
  LOAD r4, r0
  LDI r7, 0x30499D
  STORE r7, r9
  LOAD r14, r7
  CMPI r13, 170
  LDI r13, 15
loop_1:
  ADDI r11, r5, 65
  LDI r27, 3167
  LDI r4, 2358
  LDI r14, 3388
  LDI r10, 2024
  LDI r3, 1
  LINE r27, r4, r14, r10, r3
  LDI r3, 1
  SUB r13, r13, r3
  JNZ r13, loop_1
main_2:
  ANDI r5, r0, 72
  CMP r1, r5
  CMPI r3, 8
  ADDI r8, r1, 32
  CMPI r12, 10
  MOD r1, r13, r2
  FRAME
  JMP main_2
