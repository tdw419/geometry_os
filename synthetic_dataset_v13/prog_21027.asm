; DESCRIPTION: Composite: Places a green dot at position (170, 113) then Places a white circle of radius 29 at center (403, 42).
; PLAN: r0=170(x), r1=113(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=42(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 113
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 403
LDI r6, 42
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
