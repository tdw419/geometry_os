; drawing loop program
; initialization
  LDI r6, 2
  LDI r13, 32
  LDI r9, 2656
  LDI r7, 0x72D282
  LDI r4, 255
main_0:
  LDI r1, 3948
  LDI r18, 2764
  LDI r11, 745
  DRAWTEXT r1, r18, r11, "WORLD"
  LDI r5, 0x952C0E
  LDI r0, 255
  LDI r7, 3216
  LDI r7, 256
  LDI r8, 0xA935AC
  LINE r5, r0, r7, r7, r8
  LDI r5, 64
  LDI r13, 0xC5D6D8
  LDI r0, 0
  LDI r11, 3451
  LDI r8, 3666
  LINE r5, r13, r0, r11, r8
  LDI r3, 0x60B44A
  LDI r4, 909
  LDI r14, 0x09C52C
  WPIXEL
  SHL r3, r12, r22
  SHR r13, r14, r8
  SHR r10, r3, r0
  LDI r8, 16
  LDI r3, 0x0C7A46
  LDI r10, 0
  TEXT r8, r3, r10, "HELLO"
  FRAME
  JMP main_0
