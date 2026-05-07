; drawing loop program
; initialization
  LDI r3, 64
  LDI r5, 10
  LDI r25, 0x802729
main_0:
  IKEY r29
  CMPI r29, 0x7ECA21
  JNZ r29, key_1
  LDI r4, 0
  LDI r9, 673
  LDI r0, 0x648DD5
  WPIXEL
  LDI r22, 2086
  LDI r6, 315
  LDI r15, 4
  DRAWTEXT r22, r6, r15, "WORLD"
  IKEY r10
  CMPI r10, 46
  JNZ r10, key_2
  SHL r10, r18, r1
  SHR r5, r15, r27
  SHR r7, r18, r6
  FRAME
  JMP main_0
