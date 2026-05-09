; DESCRIPTION: Renders a white box of size 92x38 starting at (70, 146).
; PLAN: r0=70(x), r1=146(y), r2=92(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 146
LDI r2, 92
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
