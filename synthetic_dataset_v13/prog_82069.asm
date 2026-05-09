; DESCRIPTION: Renders a cyan box of size 90x92 starting at (165, 38).
; PLAN: r0=165(x), r1=38(y), r2=90(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 38
LDI r2, 90
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
