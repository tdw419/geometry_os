; mixed program
; initialization
  LDI r10, 0x12AFFF
  LDI r5, 1085
  LDI r9, 429
  LDI r7, 256
  LDI r28, 0xCA5287
  PUSH r9
  PUSH r12
  PUSH r7
  PUSH r13
  XOR r8, r5, r13
  XOR r15, r6, r9
  SUB r7, r13, r6
  POP r13
  POP r7
  POP r12
  POP r9
  CMPI r10, 0x36B15A
  LDI r5, 4
loop_0:
  SHL r0, r8, r15
  ADD r5, r10, r11
  LDI r7, 1
  SUB r5, r5, r7
  JNZ r5, loop_0
  SHR r12, r3, r10
  SHL r8, r4, r13
  SHLI r5, r3, 10
  AND r9, r4, r15
  AND r7, r14, r0
main_1:
  IKEY r12
  CMPI r12, 0x0A64BE
  JNZ r12, key_2
  MOD r6, r3, r25
  LDI r16, 0xEE13BD
  LDI r8, 3159
  LDI r0, 255
  DRAWTEXT r16, r8, r0, "WORLD"
  AND r10, r4, r11
  XOR r0, r2, r11
  OR r14, r2, r3
  AND r3, r0, r6
  FRAME
  JMP main_1
