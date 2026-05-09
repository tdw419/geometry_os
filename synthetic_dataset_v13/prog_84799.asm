; DESCRIPTION: Places a yellow 20x33 rectangle at position (154, 171).
; PLAN: r0=154(x), r1=171(y), r2=20(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 171
LDI r2, 20
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
