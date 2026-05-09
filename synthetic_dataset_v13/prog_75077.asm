; DESCRIPTION: Composite: Renders a blue disk with center (182, 111) and radius 77 then Places a red 82x30 rectangle at position (32, 133).
; PLAN: r0=182(x), r1=111(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=133(y), r7=82(width), r8=30(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 111
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 133
LDI r7, 82
LDI r8, 30
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
