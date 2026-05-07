; mixed program
; initialization
  LDI r0, 0xEFE58E
  LDI r4, 2589
  LDI r13, 2
  LDI r9, 1495
  LDI r3, 256
  LDI r2, 405
  LDI r15, 8
  LDI r8, 370
  AND r2, r10, r15
  OR r4, r9, r3
  AND r28, r8, r13
  CMP r2, r13
  JZ r2, else_0
  SHR r14, r1, r3
  ADD r6, r12, r14
  MOD r0, r7, r12
  JMP endif_1
else_0:
  LDI r4, 0x0DB899
  LDI r7, 3093
  LDI r13, 1
  LDI r10, 3929
  LDI r13, 256
  LINE r4, r7, r13, r10, r13
  LDI r14, 2066
  LDI r10, 0x58090A
  LDI r15, 256
  WPIXEL
endif_1:
  LDI r0, 16
loop_2:
  LDI r14, 3639
  LDI r24, 0xEFE661
  LDI r12, 2622
  WPIXEL
  LDI r5, 337
  LDI r10, 2824
  LDI r12, 3013
  WPIXEL
  ADDI r0, r6, 64
  LDI r14, 1
  SUB r0, r0, r14
  JNZ r0, loop_2
main_3:
  XOR r0, r2, r11
  AND r1, r7, r2
  AND r1, r0, r14
  SAR r6, r8, r11
  SAR r9, r8, r7
  SHR r1, r10, r12
  LDI r4, 255
  LDI r22, 0xDC9E32
  LDI r0, 2128
  DRAWTEXT r4, r22, r0, "WORLD"
  FRAME
  JMP main_3
