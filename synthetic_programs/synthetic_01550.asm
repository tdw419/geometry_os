; mixed program
; initialization
  LDI r3, 0x91D949
  LDI r15, 0x5438E2
  CALL func_0
func_0:
  AND r15, r9, r8
  DIV r12, r6, r15
  SHR r15, r9, r23
  MOD r0, r6, r9
  MOD r5, r3, r7
  MOD r9, r30, r12
  RET
  LDI r6, 0xE247A1
  STORE r6, r5
  LOAD r11, r6
  LDI r0, 0x261A6D
  STORE r0, r13
  LOAD r14, r0
  LDI r11, 0x58C646
  STORE r11, r5
  LOAD r13, r11
  LDI r13, 0xC52F25
  STORE r13, r6
  LOAD r11, r13
  XOR r3, r2, r0
  AND r10, r3, r9
  XOR r5, r0, r2
  AND r4, r12, r6
  LDI r9, 0xA508E4
  LDI r4, 256
  LDI r1, 0x4753AC
  DRAWTEXT r9, r4, r1, "WORLD"
  LDI r9, 2
loop_1:
  LDI r14, 16
  LDI r10, 0xDDEFD0
  LDI r11, 128
  LDI r15, 2
  LDI r2, 1068
  LINE r14, r10, r11, r15, r2
  ADDI r9, r15, 1
  SHL r10, r14, r2
  SUBI r7, r26, 0
  LDI r6, 1
  SUB r9, r9, r6
  JNZ r9, loop_1
main_2:
  CMP r1, r3
  AND r5, r0, r8
  AND r10, r2, r4
  AND r10, r29, r25
  FRAME
  JMP main_2
