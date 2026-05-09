; DESCRIPTION: Renders a orange box of size 60x111 starting at (215, 65).
; PLAN: r0=215(x), r1=65(y), r2=60(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 65
LDI r2, 60
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
