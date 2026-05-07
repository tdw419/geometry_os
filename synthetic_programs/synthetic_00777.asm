; counted animation
; initialization
  LDI r6, 0xDF3D5E
  LDI r8, 0x4CA119
  LDI r1, 2416
  LDI r3, 128
  LDI r13, 0xEE29A6
  LDI r27, 0x20BF36
  LDI r10, 0x2C3DA3
  LDI r9, 686
  LDI r3, 0x729F29
loop_0:
  CMPI r1, r13, 0xEB60AC
  LDI r6, 1
  SUB r3, r3, r6
  JNZ r3, loop_0
  HALT
