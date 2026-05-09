; DESCRIPTION: Places a blue 80x33 rectangle at position (242, 177).
; PLAN: r0=242(x), r1=177(y), r2=80(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 177
LDI r2, 80
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
