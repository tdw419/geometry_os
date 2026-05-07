; Synthetic GeOS Program
; initialization
LDI r17, 863
LDI r13, 781
LDI r20, 256
; main loop
loop_0:
  LDI r21, 65535
  FILL r21
CIRCLE r9, r4, r11, r5
LINE r12, r24, r21, r14, r30
LINE r31, r5, r14, r14, r27
  FRAME
  JMP loop_0