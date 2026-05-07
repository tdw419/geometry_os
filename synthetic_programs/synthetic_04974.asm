; mixed program
; initialization
  LDI r8, 188
  LDI r3, 2392
  LDI r7, 3973
  LDI r10, 514
  LDI r6, 3960
  LDI r7, 1106
  PSET r10, r6, r7
  PUSH r5
  PUSH r15
  PUSH r3
  PUSH r6
  AND r4, r15, r17
  ADD r13, r0, r8
  SUB r18, r3, r9
  XOR r13, r11, r8
  POP r6
  POP r3
  POP r15
  POP r5
  OR r12, r8, r9
  AND r0, r8, r11
  OR r7, r14, r8
  XOR r9, r10, r11
  OR r8, r7, r3
  XOR r3, r14, r5
  OR r11, r10, r21
  XOR r9, r5, r20
  XOR r15, r6, r9
  LDI r12, 0xE42BB8
loop_0:
  MOD r7, r8, r11
  ANDI r4, r7, 1
  LDI r9, 1
  SUB r12, r12, r9
  JNZ r12, loop_0
  CMPI r8, 0x5F7BAF
  HALT
