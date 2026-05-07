; mixed program
; initialization
  LDI r14, 2
  LDI r10, 10
  LDI r7, 10
; palette
  LDI r0, 0x40CD
  LDI r5, 1
  LDI r4, 0x000000
  STORE r0, r4
  ADD r0, r0, r5
  LDI r4, 0x550077
  STORE r0, r4
  ADD r0, r0, r5
  LDI r4, 0x00FF44
  STORE r0, r4
  ADD r0, r0, r5
  LDI r4, 0x00FFFF
  STORE r0, r4
  ADD r0, r0, r5
  LDI r4, 0x550077
  STORE r0, r4
  ADD r0, r0, r5
  LDI r4, 0x0044FF
  STORE r0, r4
  ADD r0, r0, r5
  LDI r4, 0xFF00FF
  STORE r0, r4
  ADD r0, r0, r5
  LDI r4, 0xAA00AA
  STORE r0, r4
  ADD r0, r0, r5
  LDI r4, 0xFFFFFF
  STORE r0, r4
  ADD r0, r0, r5
  LDI r2, 2
  LDI r2, 0x608398
  LDI r5, 1
  LDI r0, 3784
  CIRCLE r2, r2, r5, r0
  LDI r11, 27
loop_0:
  SUB r1, r4, r13
  LDI r7, 0xDBAB72
  LDI r12, 3180
  LDI r6, 0x67029D
  LDI r2, 0xA365A8
  LDI r15, 255
  RECTF r7, r12, r6, r2, r15
  ADDI r10, r1, 50
  LDI r12, 1
  SUB r11, r11, r12
  JNZ r11, loop_0
  SHR r9, r8, r13
main_1:
  XOR r2, r9, r14
  AND r0, r6, r11
  AND r8, r12, r4
  AND r11, r2, r5
  SHR r8, r2, r13
  SHL r3, r1, r12
  LDI r3, 0xB38DAE
  LDI r14, 82
  LDI r6, 0xE7BC8E
  DRAWTEXT r3, r14, r6, "WORLD"
  XOR r12, r15, r16
  XOR r28, r10, r6
  XOR r28, r27, r11
  OR r15, r14, r8
  FRAME
  JMP main_1
