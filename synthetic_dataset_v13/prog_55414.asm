; DESCRIPTION: Renders a cyan box of size 62x48 starting at (404, 69).
; PLAN: r0=404(x), r1=69(y), r2=62(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 69
LDI r2, 62
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
