; DESCRIPTION: Renders a cyan box of size 94x60 starting at (271, 135).
; PLAN: r0=271(x), r1=135(y), r2=94(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 135
LDI r2, 94
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
