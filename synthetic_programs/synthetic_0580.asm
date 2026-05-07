; Synthetic GeOS Program
; initialization
LDI r7, 984
LDI r0, 437
LDI r26, 111
LDI r10, 996
LDI r26, 0x00FFFF
; main loop
loop_0:
  LDI r29, 16777215
  FILL r29
CIRCLE r19, r1, r15, r21
  CMP r30, r13
  JZ r0, loop_0
  FRAME
  JMP loop_0