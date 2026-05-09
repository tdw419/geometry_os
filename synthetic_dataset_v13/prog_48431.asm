; DESCRIPTION: Places a white 112x20 rectangle at position (303, 146).
; PLAN: r0=303(x), r1=146(y), r2=112(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 146
LDI r2, 112
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
