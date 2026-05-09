; DESCRIPTION: Renders a magenta box of size 16x113 starting at (243, 111).
; PLAN: r0=243(x), r1=111(y), r2=16(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 111
LDI r2, 16
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
