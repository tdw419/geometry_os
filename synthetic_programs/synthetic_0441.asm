; Synthetic GeOS Program
; initialization
LDI r7, 0x00FF00
LDI r12, 996
LDI r6, 0x00FFFF
LDI r31, 853
; arithmetic section
LDI r3, 478
ADD r29, r10, r13
ADD r27, r18, r20
; main loop
loop_0:
  LDI r21, 65535
  FILL r21
LINE r3, r30, r20, r5, r16
LINE r17, r4, r16, r24, r18
  FRAME
  JMP loop_0