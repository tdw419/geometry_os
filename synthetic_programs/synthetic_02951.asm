; drawing loop program
; initialization
  LDI r10, 2361
  LDI r15, 8
  LDI r3, 32
  LDI r1, 2409
  LDI r0, 188
  LDI r7, 256
  LDI r11, 3237
  LDI r5, 0xFB124A
main_0:
  OR r13, r0, r18
  XOR r8, r3, r4
  MUL r15, r13, r12
  AND r3, r0, r2
  LDI r8, 32
  LDI r14, 0xEAAE47
  LDI r10, 0xDEDBB5
  WPIXEL
  LDI r6, 256
  LDI r15, 0xB49A44
  LDI r12, 2030
  DRAWTEXT r6, r15, r12, "WORLD"
  FRAME
  JMP main_0
