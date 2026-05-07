; mixed program
; initialization
  LDI r14, 0
  LDI r10, 0x5D9AB6
  LDI r7, 3661
  LDI r13, 0xA9F5CE
  LDI r6, 2857
  LDI r16, 0x03EAB9
  LDI r12, 10
  CALL func_0
func_0:
  DIV r14, r13, r4
  ADD r7, r8, r2
  MUL r11, r0, r14
  SUB r5, r1, r3
  ADD r29, r14, r6
  SHR r0, r6, r15
  RET
  AND r4, r11, r13
  XOR r2, r7, r8
  AND r11, r4, r3
  AND r14, r11, r5
  PUSH r5
  PUSH r15
  PUSH r8
  PUSH r15
  OR r13, r4, r3
  AND r5, r4, r10
  OR r9, r17, r0
  POP r15
  POP r8
  POP r15
  POP r5
  CMPI r26, 0x948428
main_1:
  LDI r15, 1052
  LDI r6, 0x0E9272
  LDI r5, 255
  DRAWTEXT r15, r6, r5, "WORLD"
  LDI r3, 0xE08FD4
  LDI r14, 1048
  LDI r9, 2
  LDI r15, 3152
  LDI r9, 64
  RECTF r3, r14, r9, r15, r9
  FRAME
  JMP main_1
