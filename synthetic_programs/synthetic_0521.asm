; Synthetic GeOS Program
; initialization
LDI r13, 180
LDI r30, 942
; arithmetic section
ADD r31, r13, r25
LDI r30, 699
SUB r11, r23, r23
ADD r25, r0, r18
LDI r30, 702
; main loop
loop_0:
  LDI r6, 16777215
  FILL r6
RECTF r9, r15, r6, r4, r3
PSET r27, r31, r8
PSET r31, r13, r10
  CMP r21, r30
  JZ r0, loop_0
  FRAME
  JMP loop_0