; DESCRIPTION: Renders a cyan box of size 43x120 starting at (436, 5).
; PLAN: r0=436(x), r1=5(y), r2=43(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 5
LDI r2, 43
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
