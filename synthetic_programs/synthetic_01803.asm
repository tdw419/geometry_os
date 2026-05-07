; counted animation
; initialization
  LDI r5, 8
  LDI r9, 16
  LDI r10, 3863
  LDI r10, 0
loop_0:
  SHL r9, r6, r4
  LDI r2, 1
  SUB r10, r10, r2
  JNZ r10, loop_0
  HALT
