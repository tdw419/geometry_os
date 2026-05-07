; counted animation
; initialization
  LDI r16, 2439
  LDI r15, 128
  LDI r3, 1
  LDI r7, 64
  LDI r25, 0x65CA60
  LDI r8, 1
  LDI r0, 0xC99D89
  LDI r12, 2048
  LDI r0, 42
loop_0:
  AND r0, r12, r7
  LDI r5, 1
  SUB r0, r0, r5
  JNZ r0, loop_0
  LDI r28, 0x5CC994
loop_1:
  SHR r5, r12, r14
  ANDI r15, r11, 100
  LDI r15, 1
  SUB r28, r28, r15
  JNZ r28, loop_1
  HALT
