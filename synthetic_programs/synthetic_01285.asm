; mixed program
; initialization
  LDI r17, 0x0A64A1
  LDI r7, 10
  LDI r2, 128
  LDI r0, 1016
  LDI r13, 0xF8E115
  LDI r10, 128
  LDI r5, 0xEE3F2E
  LDI r11, 4075
; palette
  LDI r11, 0x22EA
  LDI r14, 1
  LDI r4, 0xFFEE00
  STORE r11, r4
  ADD r11, r11, r14
  LDI r4, 0x0000FF
  STORE r11, r4
  ADD r11, r11, r14
  LDI r4, 0x00FFAA
  STORE r11, r4
  ADD r11, r11, r14
  LDI r4, 0xFFFF00
  STORE r11, r4
  ADD r11, r11, r14
  LDI r9, 60x2030
  STORE r9, r10
  LOAD r2, r9
  LDI r2, 0x12DB4F
  STORE r2, r22
  LOAD r12, r2
  PUSH r30
  PUSH r10
  PUSH r13
  PUSH r2
  SHR r15, r6, r11
  SUB r8, r3, r9
  SHR r7, r14, r9
  SHL r7, r4, r5
  SHR r3, r2, r13
  POP r2
  POP r13
  POP r10
  POP r30
  CALL func_0
func_0:
  MOD r31, r8, r5
  DIV r5, r8, r12
  SHL r5, r12, r2
  SHL r10, r7, r15
  AND r2, r11, r12
  RET
  CMP r9, r2
  JNZ r9, else_1
  OR r7, r4, r26
  MUL r0, r29, r2
  DIV r13, r8, r2
  JMP endif_2
else_1:
  LDI r8, 8
  LDI r14, 2333
  LDI r5, 128
  LDI r8, 0x30B8C9
  LDI r12, 4
  LINE r8, r14, r5, r8, r12
  LDI r11, 3287
  LDI r2, 0x4D4F92
  LDI r11, 64
  LDI r10, 16
  LDI r5, 0x8EB526
  RECTF r11, r2, r11, r10, r5
  LDI r13, 1604
  LDI r0, 52
  LDI r4, 0xB7D113
  PSETI
  LDI r8, 0xAAC18E
  LDI r5, 0
  LDI r4, 0x5FAF10
  LDI r1, 0x95E484
  CIRCLE r8, r5, r4, r1
endif_2:
  SHR r8, r4, r15
  SHR r11, r7, r15
  SHLI r6, r13, 6
main_3:
  LDI r11, 10
  LDI r14, 0x2F7068
  LDI r11, 1082
  LDI r9, 0
  LDI r14, 2
  RECTF r11, r14, r11, r9, r14
  LDI r13, 2455
  LDI r8, 4
  LDI r8, 16
  TEXT r13, r8, r8, "HELLO"
  LDI r13, 1413
  LDI r5, 256
  LDI r2, 16
  LDI r0, 2741
  CIRCLE r13, r5, r2, r0
  DIV r0, r3, r14
  FRAME
  JMP main_3
