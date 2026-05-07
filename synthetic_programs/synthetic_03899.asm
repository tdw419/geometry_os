; mixed program
; initialization
  LDI r2, 32
  LDI r12, 0x94203B
  LDI r4, 767
  LDI r15, 1912
  LDI r6, 1826
  LDI r3, 0xCE7AE6
  LDI r0, 32
  AND r5, r3, r10
  AND r14, r10, r0
  OR r11, r9, r1
  XOR r9, r3, r11
  CMP r4, r12
  AND r22, r13, r6
  OR r11, r15, r14
  AND r15, r7, r6
  LDI r10, 4032
  LDI r2, 2
  LDI r23, 3479
  TEXT r10, r2, r23, "HELLO"
  SHLI r5, r2, 6
  SAR r12, r3, r15
  SHLI r8, r3, 0xDF1F41
  SHLI r1, r9, 3
  LDI r12, 30
loop_0:
  SUBI r9, r5, 8
  OR r1, r2, r4
  ADD r7, r10, r5
  LDI r3, 1
  SUB r12, r12, r3
  JNZ r12, loop_0
  HALT
